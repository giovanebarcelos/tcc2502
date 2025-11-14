import re

texto = "aaa"
padrao = r"^(.)\1+$"

ret = re.findall(padrao, texto)

for value in ret:
    print('-', value)

