@echo off
jflex calc.flex 
java java_cup.Main calc.cup 
javac *.java 
java parser calc.txt
pause