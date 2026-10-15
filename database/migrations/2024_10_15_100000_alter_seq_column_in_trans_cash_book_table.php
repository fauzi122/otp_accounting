<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // 1. Ubah tipe kolom seq menjadi INT(11)
        DB::statement('ALTER TABLE trans_cash_book MODIFY COLUMN seq INT(11) NULL;');

        // 2. Sesuaikan data lama yang nomor seq-nya sempat dobel/mentok di 10
        $romanMonths = [
            '01' => 'I',  '02' => 'II',  '03' => 'III', '04' => 'IV',
            '05' => 'V',  '06' => 'VI',  '07' => 'VII', '08' => 'VIII',
            '09' => 'IX', '10' => 'X',   '11' => 'XI',  '12' => 'XII'
        ];

        // Cari grup transaksi (type, tahun, bulan) yang memiliki duplikasi seq
        $affectedGroups = DB::table('trans_cash_book')
            ->select('type', DB::raw('YEAR(date_invoice) as y'), DB::raw('MONTH(date_invoice) as m'))
            ->groupBy('type', DB::raw('YEAR(date_invoice)'), DB::raw('MONTH(date_invoice)'), 'seq')
            ->havingRaw('COUNT(*) > 1')
            ->distinct()
            ->get();

        foreach ($affectedGroups as $group) {
            $records = DB::table('trans_cash_book')
                ->where('type', $group->type)
                ->whereYear('date_invoice', $group->y)
                ->whereMonth('date_invoice', $group->m)
                ->orderBy('id', 'asc')
                ->get();

            $seq = 1;
            foreach ($records as $record) {
                $date = strtotime($record->date_invoice);
                $year = date('y', $date);
                $month = date('m', $date);
                $seqFormatted = str_pad($seq, 4, '0', STR_PAD_LEFT);

                switch ($record->type) {
                    case 'Bukti Kas Keluar':
                        $code = 'BKK';
                        break;
                    case 'Bukti Kas Masuk':
                        $code = 'BKM';
                        break;
                    case 'Bukti Bank Keluar':
                        $bank = strtoupper("{$record->code_bank}-{$record->currency}");
                        $code = "BBK/{$bank}";
                        break;
                    case 'Bukti Bank Masuk':
                        $bank = strtoupper("{$record->code_bank}-{$record->currency}");
                        $code = "BBM/{$bank}";
                        break;
                    default:
                        $code = 'CB';
                }

                $newTransNumber = "{$code}/{$year}/{$romanMonths[$month]}/{$seqFormatted}";

                if ($record->seq != $seq || $record->transaction_number != $newTransNumber) {
                    DB::table('trans_cash_book')->where('id', $record->id)->update([
                        'seq' => $seq,
                        'transaction_number' => $newTransNumber
                    ]);

                    DB::table('general_ledgers')
                        ->where('id_ref', $record->id)
                        ->where('source', 'Cash Book')
                        ->update([
                            'ref_number' => $newTransNumber
                        ]);
                }

                $seq++;
            }
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::statement('ALTER TABLE trans_cash_book MODIFY COLUMN seq VARCHAR(45) NULL;');
    }
};
