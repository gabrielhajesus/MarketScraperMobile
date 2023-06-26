from bs4 import BeautifulSoup
from urllib.request import URLopener
import time
from banco import Banco
import undetected_chromedriver as uc
import chromedriver_autoinstaller


# Conexão com o Mongodb
banco_de_dados = Banco.inicia_banco()
pichau = Banco.pichau(banco_de_dados)

# Iniciando o emulador idetectavel do google
version_main = int(
    chromedriver_autoinstaller.get_chrome_version().split(".")[0])
options = uc.ChromeOptions()
options.add_argument('--ignore-certificate-errors')
options.add_argument('--headless')
driver = uc.Chrome(use_subprocess=True, options=options,
                   version_main=version_main)
driver.maximize_window()
print("Chrome Inicializado")

# Obtendo a campanha de promoção atual
driver.get("https://www.pichau.com.br/")
paginaprincipal = BeautifulSoup(driver.page_source, 'html.parser')

campanhas = []
nomes_campanha = []

campanhaAtual = paginaprincipal.main.find(
    'a', {"title": "Promoção Pichau"}).get('href')
nomedacampanha = paginaprincipal.main.find(
    'a', {"title": "Promoção Pichau"}).get('href').split('/')[-1]
"""if paginaprincipal.main.find(
        'a', {"title": "Banner Promoção HOME secundário"}).get('href') not in campanhas:
    if paginaprincipal.main.find(
            'a', {"title": "Banner Promoção HOME secundário"}).get('href').split('/')[-1] not in nomes_campanha or paginaprincipal.main.find(
            'a', {"title": "Banner Promoção HOME secundário"}).get('href').split('/')[-1].split('?')[0] not in nomes_campanha:
        campanhas.append(paginaprincipal.main.find(
            'a', {"title": "Banner Promoção HOME secundário"}).get('href'))
        nomes_campanha.append(paginaprincipal.main.find(
            'a', {"title": "Banner Promoção HOME secundário"}).get('href').split('/')[-1])

campanhas_secundarias = paginaprincipal.main.findAll(
    'a', {"title": "Homepage 2 Banners"})
for campanha in campanhas_secundarias:
    if campanha.get('href') not in campanhas:
        if campanha.get('href').split('/')[-1].split('?')[0] not in nomes_campanha or campanha.get('href').split('/')[-1] not in nomes_campanha:
            campanhas.append(campanha.get('href'))
            nomes_campanha.append(campanha.get('href').split('/')[-1])"""
print('Pegando a campanha : ' + nomedacampanha)

# Indo para a campanha atual
driver.get(campanhaAtual)

# Pegando o tamanho completo da página
last_height = driver.execute_script("return document.body.scrollHeight")
print(last_height)
SCROLL_PAUSE_TIME = 10
while True:
    # Scroll down to bottom
    driver.execute_script(
        # "window.scrollTo(0, " + str(int(0.99*int(str(last_height).replace(')', '').split(' ')[-1]))) + ");")
        "window.scrollTo(0, document.body.scrollHeight);")

    # Wait to load page
    time.sleep(SCROLL_PAUSE_TIME)

    # Calculate new scroll height and compare with last scroll height
    new_height = driver.execute_script("return document.body.scrollHeight")
    if new_height == last_height:
        print(range(last_height))
        for tamanho in range(1750):
            driver.execute_script(
                "window.scrollTo(0, " + str(tamanho*250) + ");")
        break
    last_height = new_height


paginacompleta = BeautifulSoup(driver.page_source, 'html.parser')
print('Pagina completa')

# Obtendo as TAGs de interesse
anuncios = paginacompleta.find('main').find('div', {
    'class': "infinite-scroll-component__outerdiv"}).find('div').find('div').findAll('a')

# Declarando variável cards e imagens
cards = []
imagens = []
erros = []

# Coletando as informações dos CARDS
for anuncio in anuncios:
    card = {}

    # Nome
    card['name'] = anuncio.find(
        'div', {'class': 'MuiCardContent-root'}).find('h2').getText()

    try:
        # Valor antigo
        preco_antigo = anuncio.find('div', {'class': 'MuiCardContent-root'}).find(
            'div').find('div').find('div').find('div').getText()
        preco_antigo = preco_antigo.split(' ')
        preco_antigo.pop()
        del preco_antigo[0]
        preco_antigo = " ".join(preco_antigo)

        card['old_price_card'] = preco_antigo

        # Valor Completo
        preco = anuncio.find('div', {'class': 'MuiCardContent-root'}
                             ).div.div.div.div.find_next_sibling().find_next_sibling().getText()

        card['price_card'] = preco

        # Preço parcelado
        desconto = anuncio.find('div', {'class': 'MuiCardContent-root'}
                                ).div.div.div.span.find_next_sibling().find_next_sibling().getText()
        preco_parcelado = anuncio.find('div', {
            'class': 'MuiCardContent-root'}).div.div.find_next_sibling().find_next_sibling().div.div.getText()
        parcelado = anuncio.find('div', {'class': 'MuiCardContent-root'}
                                 ).div.div.find_next_sibling().find_next_sibling().div.span.getText()
        card['price_text_card'] = preco_parcelado + \
            ' ' + parcelado + ' e avista ' + desconto

        # Tag da Promocao
        card['tag_campanha'] = nomedacampanha

        # Link do produto
        card['link_produto'] = 'https://www.pichau.com.br' + \
            anuncio.get('href')

        # Link da imagem
        card['imagem'] = anuncio.find(
            'div', {"class": "lazyload-wrapper"}).img['src']

        # Loja da pichau
        card['loja'] = 'Pichau'

        cards.append(card)
    except:
        continue

    # Adicionando as imagens a lista
    """try:
        imagem = anuncio.find(
            'div', {"class": "lazyload-wrapper"}).img['src']
        imagens.append({'imagem': imagem, 'nome': card['name']})
    except:
        erros.append([card['name'], anuncio.find(
            'div', {"class": "lazyload-wrapper"}).img])"""

# Definindo um header para o download das imagens
opener = URLopener()
opener.addheader(
    'User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36')

"""for imagem in imagens:
    nome = imagem['nome']
    nome = Banco.convertenome(nome)

    filename, headers = opener.retrieve(
        imagem['imagem'], './src/site/static/img/' + nome + '.jpg')"""


# Inserindo o resultado no banco de dados
pichau.insert_many(cards)

# Fechando o Driver
driver.quit()
