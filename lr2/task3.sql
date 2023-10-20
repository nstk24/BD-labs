/*выводим только некоторые столбцы и  строки для которых membercost = 0 с помощью условия после функции WHERE*/
USE cd;
SELECT facility,membercost FROM facilities WHERE membercost = 0 ;