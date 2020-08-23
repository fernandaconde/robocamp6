import psycopg2

def remove_customer_by_cpf(cpf):
    
    cpf_formatado = cpf[:3] + "." + cpf[3:6] + "-" + cpf[9:]

    conn = psycopg2.connect(
        host='zepalheta-postgres',
        database='zepalheta',
        user='postgres',
        password='qaninja'
    )

    cur = conn.cursor()

    cur.execute("delete from public.customers where cpf = '000.000.014-06';")

    conn.commit()

    cur.close()
    conn.close()