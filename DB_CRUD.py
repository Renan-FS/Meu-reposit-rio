#conectar a um banco
def conectaBanco():
    import sqlite3
    nomeBanco = str(input('Digite o nome do seu banco: '))
    conn = sqlite3.connect('{}.db'.format(nomeBanco))
    c = conn.cursor()
    conn.commit()
    conn.close()


#consultar uma tabela do banco
def consultaTabela():
    import sqlite3
    nomeBanco = str(input('Digite o banco que vc queira consultar: '))
    conn = sqlite3.connect('{}.db'.format(nomeBanco))
    c = conn.cursor()
    conn.commit()
    nomeTabela = str('Digite o nome da tabela que vc deseja consultar: ')
    for tabela in c.execute('select * from {}'.format(nomeTabela)):
        print(tabela)
    conn.close()


#criar uma nova tabela
def criaTabela():
    import sqlite3
    nomeBanco = str(input('Digite o nome do seu banco: '))
    conn = sqlite3.connect('{}.db'.format(nomeBanco))
    c = conn.cursor()
    conn.commit() 
    tab = str(input('Digite o nome da tabela: '))
    r = 'S'
    Campos = []
    nomeCampos = []
    tipoCampos = []
    listaCampos = []
    while r == 'S':
        Campo = str(input('Digite o nome do campo + espaço + seu tipo: '))
        Campos.append(Campo)
        r = str(input('Quer criar mais uma coluna? [S/N] ')).upper()
    c.execute('CREATE TABLE {} ({})'.format(tab, Campos))
    print('Tabela {} criada com sucesso'.format(tab))
    conn.commit
    conn.close()


#conferir o numero de colunas
def tamanhoTabela():
    print(len(Campo))


#inserir novos campos na tabela
def insereLinha():
    import sqlite3
    nomeBanco = str(input('Digite o nome do seu banco: '))
    conn = sqlite3.connect('{}.db'.format(nomeBanco))
    c = conn.cursor()
    tabela = str(input('Digite o nome da tabela: '))
    x1 = int(input('Insira o {}: '.format(Campos[0]))
    x2 = str(input('Insira o {}: '.format(Campos[1]))   
    c.execute('insert into {} ({}, {}) values (?, ?)', (x1, x2).format(tabela, Campos[0], Campos[1]))
    conn.commit()
    conn.close()

#deletando tabela
def deletaTabela():
    import sqlite3
    conn = sqlite3.connect('teste2.db')
    c = conn.cursor()
    conn.commit()
    def deletaTabela():
        campo1 = int(input('Insira a chave primária da tabela que deseja deletar: '))
        c.execute('DELETE from "table" WHERE pk = ?', (campo1))
        conn.commit()
        print('Tabela deletada com sucesso')
        conn.close()
