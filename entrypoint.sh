#!/bin/bash
# Corrige finais de linha dos arquivos em bin/ para LF
find ./bin -type f -exec sed -i 's/\r$//' {} \;

# Executa o comando passado (ex: rails server)
exec "$@"