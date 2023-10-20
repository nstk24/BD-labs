/*через оператор > вцыводятся члены клуба зарегистрированные с 1 сентября 2012 года*/
USE cd;
SELECT surname, firstname FROM members WHERE joindate > '2012-08-31';
