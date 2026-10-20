#!/bin/sh
# CONTRATO (não mude): escreva na saída padrão só o nome da réplica que
# respondeu e termine com código 0; ou escreva INDISPONIVEL e termine com 1.
# Nunca demore mais que 5 segundos, mesmo com tudo fora do ar.

REPLICAS="10.0.20.21 10.0.20.22 10.0.20.23"

for ip in $REPLICAS; do
  r=$(curl -s --connect-timeout 1.3 -m 1.4 "http://$ip:8080/" 2>/dev/null)
  if [ -n "$r" ]; then
    printf '%s\n' "$r"
    exit 0
  fi
done

printf '%s\n' "INDISPONIVEL"
exit 1
