REM Batch file para criar o file lambda_function_payload.zip 
@echo off

cd "infrastructure"

REM Declara variavel para reutilização nas validações do diretório
SET PACKAGE=package

REM Cria o diretório e instala as dependências da função lambda
IF "-d" "%PACKAGE%" (
  echo "O Diretório "%PACKAGE%" já existe."
) ELSE (
  echo "============================================="
  echo "Criando o diretório "%PACKAGE%"..."
  mkdir "%PACKAGE%"
  echo "O diretório "%PACKAGE%" foi criado."
  echo "============================================="
)

REM Declara variavel que localiza o requirements com as dependências do projeto
SET FILE_REQUIREMENTS=%CD%\..\etl\lambda_requirements.txt

# Verifica se o arquivo lambda_requirements existe
IF "-f" "%FILE_REQUIREMENTS%" (
  echo "============================================="
  echo "Instalando dependências localizadas no "%FILE_REQUIREMENTS%""
  pip "install" "--target" "%CD%\package" "-r" "%FILE_REQUIREMENTS%"
  echo "Dependências instaladas com sucesso."
  echo "============================================="
)


cd "%PACKAGE%"

REM Declara variavel que localiza a função lambda para reutilização no código.
SET %PACKAGE%LAMBDA_FUNCTION=%CD%\..\..\etl\lambda_function.py

REM Verifica se o arquivo lambda_function.py existe
IF "-f" "%LAMBDA_FUNCTION%" (
  echo "============================================="
  echo "Copiando função Handler..."
  COPY  "%LAMBDA_FUNCTION%" "."
  echo "Compactando arquivo lambda_function_payload.zip"
  start zip "-r9" "%CD%\..\lambda_function_payload.zip" "."
  echo "Arquivo compactado com sucesso!"
  echo "============================================="
)

cd ".."