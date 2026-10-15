-- ============================================================================
-- Penyesuaian Running Number Cash Book yang Mentok di 10
-- Database: otp_ok
-- Tabel yang disesuaikan: trans_cash_book & general_ledgers
-- ============================================================================

-- 1. Pastikan kolom seq bertipe INT
ALTER TABLE trans_cash_book MODIFY COLUMN seq INT(11) NULL;

START TRANSACTION;

-- 2. Bukti Bank Keluar (ID 160)
UPDATE trans_cash_book SET seq = 11, transaction_number = 'BBK/BCA-IDR/26/X/0011' WHERE id = 160;
UPDATE general_ledgers SET ref_number = 'BBK/BCA-IDR/26/X/0011' WHERE id_ref = 160 AND source = 'Cash Book';

-- 3. Bukti Bank Masuk (ID 158 s.d. 166)
UPDATE trans_cash_book SET seq = 11, transaction_number = 'BBM/BCA-IDR/26/X/0011' WHERE id = 158;
UPDATE general_ledgers SET ref_number = 'BBM/BCA-IDR/26/X/0011' WHERE id_ref = 158 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 12, transaction_number = 'BBM/BCA-IDR/26/X/0012' WHERE id = 159;
UPDATE general_ledgers SET ref_number = 'BBM/BCA-IDR/26/X/0012' WHERE id_ref = 159 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 13, transaction_number = 'BBM/BCA-IDR/26/X/0013' WHERE id = 161;
UPDATE general_ledgers SET ref_number = 'BBM/BCA-IDR/26/X/0013' WHERE id_ref = 161 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 14, transaction_number = 'BBM/BCA-IDR/26/X/0014' WHERE id = 162;
UPDATE general_ledgers SET ref_number = 'BBM/BCA-IDR/26/X/0014' WHERE id_ref = 162 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 15, transaction_number = 'BBM/BCA-IDR/26/X/0015' WHERE id = 163;
UPDATE general_ledgers SET ref_number = 'BBM/BCA-IDR/26/X/0015' WHERE id_ref = 163 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 16, transaction_number = 'BBM/BCA-IDR/26/X/0016' WHERE id = 164;
UPDATE general_ledgers SET ref_number = 'BBM/BCA-IDR/26/X/0016' WHERE id_ref = 164 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 17, transaction_number = 'BBM/BCA-IDR/26/X/0017' WHERE id = 165;
UPDATE general_ledgers SET ref_number = 'BBM/BCA-IDR/26/X/0017' WHERE id_ref = 165 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 18, transaction_number = 'BBM/BCA-IDR/26/X/0018' WHERE id = 166;
UPDATE general_ledgers SET ref_number = 'BBM/BCA-IDR/26/X/0018' WHERE id_ref = 166 AND source = 'Cash Book';

-- 4. Bukti Kas Keluar (ID 177 s.d. 197)
UPDATE trans_cash_book SET seq = 11, transaction_number = 'BKK/26/X/0011' WHERE id = 177;
UPDATE general_ledgers SET ref_number = 'BKK/26/X/0011' WHERE id_ref = 177 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 12, transaction_number = 'BKK/26/X/0012' WHERE id = 178;
UPDATE general_ledgers SET ref_number = 'BKK/26/X/0012' WHERE id_ref = 178 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 13, transaction_number = 'BKK/26/X/0013' WHERE id = 179;
UPDATE general_ledgers SET ref_number = 'BKK/26/X/0013' WHERE id_ref = 179 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 14, transaction_number = 'BKK/26/X/0014' WHERE id = 180;
UPDATE general_ledgers SET ref_number = 'BKK/26/X/0014' WHERE id_ref = 180 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 15, transaction_number = 'BKK/26/X/0015' WHERE id = 181;
UPDATE general_ledgers SET ref_number = 'BKK/26/X/0015' WHERE id_ref = 181 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 16, transaction_number = 'BKK/26/X/0016' WHERE id = 182;
UPDATE general_ledgers SET ref_number = 'BKK/26/X/0016' WHERE id_ref = 182 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 17, transaction_number = 'BKK/26/X/0017' WHERE id = 183;
UPDATE general_ledgers SET ref_number = 'BKK/26/X/0017' WHERE id_ref = 183 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 18, transaction_number = 'BKK/26/X/0018' WHERE id = 184;
UPDATE general_ledgers SET ref_number = 'BKK/26/X/0018' WHERE id_ref = 184 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 19, transaction_number = 'BKK/26/X/0019' WHERE id = 185;
UPDATE general_ledgers SET ref_number = 'BKK/26/X/0019' WHERE id_ref = 185 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 20, transaction_number = 'BKK/26/X/0020' WHERE id = 186;
UPDATE general_ledgers SET ref_number = 'BKK/26/X/0020' WHERE id_ref = 186 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 21, transaction_number = 'BKK/26/X/0021' WHERE id = 187;
UPDATE general_ledgers SET ref_number = 'BKK/26/X/0021' WHERE id_ref = 187 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 22, transaction_number = 'BKK/26/X/0022' WHERE id = 188;
UPDATE general_ledgers SET ref_number = 'BKK/26/X/0022' WHERE id_ref = 188 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 23, transaction_number = 'BKK/26/X/0023' WHERE id = 189;
UPDATE general_ledgers SET ref_number = 'BKK/26/X/0023' WHERE id_ref = 189 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 24, transaction_number = 'BKK/26/X/0024' WHERE id = 190;
UPDATE general_ledgers SET ref_number = 'BKK/26/X/0024' WHERE id_ref = 190 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 25, transaction_number = 'BKK/26/X/0025' WHERE id = 191;
UPDATE general_ledgers SET ref_number = 'BKK/26/X/0025' WHERE id_ref = 191 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 26, transaction_number = 'BKK/26/X/0026' WHERE id = 192;
UPDATE general_ledgers SET ref_number = 'BKK/26/X/0026' WHERE id_ref = 192 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 27, transaction_number = 'BKK/26/X/0027' WHERE id = 193;
UPDATE general_ledgers SET ref_number = 'BKK/26/X/0027' WHERE id_ref = 193 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 28, transaction_number = 'BKK/26/X/0028' WHERE id = 194;
UPDATE general_ledgers SET ref_number = 'BKK/26/X/0028' WHERE id_ref = 194 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 29, transaction_number = 'BKK/26/X/0029' WHERE id = 195;
UPDATE general_ledgers SET ref_number = 'BKK/26/X/0029' WHERE id_ref = 195 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 30, transaction_number = 'BKK/26/X/0030' WHERE id = 196;
UPDATE general_ledgers SET ref_number = 'BKK/26/X/0030' WHERE id_ref = 196 AND source = 'Cash Book';

UPDATE trans_cash_book SET seq = 31, transaction_number = 'BKK/26/X/0031' WHERE id = 197;
UPDATE general_ledgers SET ref_number = 'BKK/26/X/0031' WHERE id_ref = 197 AND source = 'Cash Book';

COMMIT;
