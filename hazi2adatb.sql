{
    "metadata": {
        "kernelspec": {
            "name": "SQL",
            "display_name": "SQL",
            "language": "sql"
        },
        "language_info": {
            "name": "sql",
            "version": ""
        }
    },
    "nbformat_minor": 2,
    "nbformat": 4,
    "cells": [
        {
            "cell_type": "code",
            "source": [
                "CREATE LOGIN user11 WITH PASSWORD = 'Jelszo111.';\r\n",
                "CREATE USER user11 FOR LOGIN masked_user;\r\n",
                "\r\n",
                "\r\n",
                "\r\n",
                "CREATE TABLE dbo.Ugyfel_Masked (\r\n",
                "    LOGIN nvarchar(255) PRIMARY KEY,\r\n",
                "    EMAIL nvarchar(255) NOT NULL,\r\n",
                "    NEV nvarchar(255) NOT NULL,\r\n",
                "    SZULEV int NULL,\r\n",
                "    NEM nvarchar(1) NULL,\r\n",
                "    CIM nvarchar(255) NULL\r\n",
                ");\r\n",
                "\r\n",
                "INSERT INTO dbo.Ugyfel_Masked (LOGIN, EMAIL, NEV, SZULEV, NEM, CIM)\r\n",
                "SELECT \r\n",
                "    LOGIN,\r\n",
                "    CONCAT(\r\n",
                "        LEFT(EMAIL, 1), '***', SUBSTRING(EMAIL, CHARINDEX('@', EMAIL), LEN(EMAIL))\r\n",
                "        ) AS EMAIL,\r\n",
                "    CONCAT('MaszkoltNev', CAST(ABS(CHECKSUM(NEWID())) % 10000 AS varchar(4))) AS NEV,\r\n",
                "    SZULEV,\r\n",
                "    NEM,\r\n",
                "    'Cím elrejtve' AS CIM\r\n",
                "FROM dbo.Ugyfel;\r\n",
                "\r\n",
                "\r\n",
                "GRANT SELECT ON dbo.Ugyfel_Masked TO user11;\r\n",
                "\r\n",
                "\r\n",
                "SELECT * FROM dbo.Ugyfel_Masked;"
            ],
            "metadata": {
                "azdata_cell_guid": "1440d7fb-1172-4810-94b9-e97247b41497",
                "language": "sql"
            },
            "outputs": [
                {
                    "output_type": "error",
                    "ename": "",
                    "evalue": "Msg 15247, Level 16, State 1, Line 1\r\nUser does not have permission to perform this action.",
                    "traceback": []
                },
                {
                    "output_type": "error",
                    "ename": "",
                    "evalue": "Msg 15247, Level 16, State 1, Line 2\r\nUser does not have permission to perform this action.",
                    "traceback": []
                },
                {
                    "output_type": "error",
                    "ename": "",
                    "evalue": "Msg 262, Level 14, State 1, Line 6\r\nCREATE TABLE permission denied in database 'webshop'.",
                    "traceback": []
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "Total execution time: 00:00:00.161"
                    },
                    "metadata": {}
                }
            ],
            "execution_count": 7
        }
    ]
}