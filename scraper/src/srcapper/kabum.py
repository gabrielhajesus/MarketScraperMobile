from bs4 import BeautifulSoup
from urllib.request import urlretrieve
from banco import Banco
import undetected_chromedriver as uc
import chromedriver_autoinstaller


def adiciona(anuncio, nomeLoja, nomecampanha):
    card = {}

    # Nome
    card['name'] = anuncio.find('span', {'class': "nameCard"}).getText()

    # Valor antigo
    card['old_price_card'] = anuncio.find(class_="oldPriceCard").getText()

    # Valor
    card['price_card'] = anuncio.find(class_="priceCard").getText()

    # Tipo de Compra
    card['price_text_card'] = anuncio.find(class_="priceTextCard").getText()

    # Tag da Promocao
    card['tag_campanha'] = nomecampanha

    # Link do produto
    card['link_produto'] = 'https://www.kabum.com.br' + \
        anuncio.find('a').get('href')

    # Loja da kabum
    card['loja'] = nomeLoja

    return card


m = 1
n = 1
# Conexão com o Mongodb
banco_de_dados = Banco.inicia_banco()
kabum = Banco.kabum(banco_de_dados)

# Iniciando o emulador idetectavel do google
version_main = int(
    chromedriver_autoinstaller.get_chrome_version().split(".")[0])
options = uc.ChromeOptions()
options.add_argument('--ignore-certificate-errors')
options.add_argument('--headless')
driver = uc.Chrome(use_subprocess=True, options=options,
                   version_main=version_main)
# driver.maximize_window()
print("Chrome Inicializado")

# Obtendo as campanhas de promoção
driver.get("https://www.kabum.com.br")
soup = BeautifulSoup(driver.page_source, 'html.parser')
campanhas = soup.findAll('a', {'id': "bannerPrincipal"})
linkcampanhas = []
for campanha in campanhas:
    if campanha.get('href') in linkcampanhas:
        continue
    else:
        linkcampanhas.append(campanha.get('href'))

for campanhaAtual in linkcampanhas:
    # Nome da campanha
    nomecampanha = (campanhaAtual.split('/'))[-1]
    listaProdutosKabum = []
    listaProdutosKabum.append(kabum.find())

    if campanhaAtual.split('/')[1] == 'produto':
        continue
    else:
        # Declarando uma lista de cards
        cards = []

        # Indo para a campanha de promoção atual
        driver.get('https://www.kabum.com.br' +
                   campanhaAtual + '?page_number=1')
        soup = BeautifulSoup(driver.page_source, 'html.parser')

        # Obtendo as paginas
        tipo_page = soup.find('ul', {'class': "pagination"}).parent.get('id')
        page = int(soup.find('ul', {'class': "pagination"}).findAll(
            'a', {'class': 'page'})[-1].getText())
        print('Campanha: ' + nomecampanha +
              ', Numero de paginas: ' + str(page))

        # Obtendo o conteudo do site
        for i in range(1, page+1):
            print('Pagina ' + str(i))

            # Obtendo o HTML
            if i > 1:
                if tipo_page == "PaginationOffer":
                    driver.get('https://www.kabum.com.br' + campanhaAtual +
                               '?pagina=' + str(i))
                elif tipo_page == "listingPagination":
                    driver.get('https://www.kabum.com.br' + campanhaAtual +
                               '?page_number=' + str(i) + '&page_size=20&facet_filters=&sort=')

                soup = BeautifulSoup(driver.page_source, 'html.parser')

            # Obtendo as TAGs de interesse
            if soup.find('main') == None:
                anuncios = soup.find('section', {"id": "blocoProdutosListagem"}).findAll(
                    'div', {'class': "productCard"})
            else:
                anuncios = soup.find('main').findAll(
                    'div', {'class': "productCard"})

            # Coletando as informações dos CARDS
            for anuncio in anuncios:
                card = adiciona(anuncio=anuncio, nomeLoja='Kabum',
                                nomecampanha=nomecampanha)

                if len(listaProdutosKabum) == 1:
                    cards.append(card)
                else:
                    # Adicionando resultado a lista cards
                    for produto in listaProdutosKabum:
                        if card['name'].split(' ')[-1] == produto['name'].split(' ')[-1] and card['price_card'] == produto['price_card']:
                            print("Produto repetido numero: " +
                                  str(n) + ", produto ->" + card['name'])
                            n = n+1
                            continue
                        else:
                            cards.append(card)
                # Adicionando as imagens ao nosso programa
                image = anuncio.find('img', {'class': 'imageCard'})
                nome = card['name']
                nome = Banco.convertenome(nome)
                urlretrieve(image.get('src'),
                            './src/site/static/img/' + nome + '.jpg')

        # Inserindo o resultado no banco de dados
        with open("saida_texto.txt", "w", encoding="utf-8") as arquivo:
            arquivo.write(str(cards))
        # kabum.insert_many(cards)

# Fechando o Driver
driver.close()
