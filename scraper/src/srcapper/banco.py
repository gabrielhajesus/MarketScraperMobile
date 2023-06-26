from pymongo import MongoClient


class Banco:
    def inicia_banco():
        # client = MongoClient('mongodb+srv://Nome:Nome123@cluster0.t8961c5.mongodb.net/')
        client = MongoClient(
            'mongodb+srv://gabrielhjalberto:gabriel123@cluster0.t8961c5.mongodb.net/')
        db = client.Market_Scraper_Mobile
        return db

    def kabum(db):
        kabum = db.kabum
        return kabum

    def pichau(db):
        pichau = db.pichau
        return pichau

    def produtos(db):
        produtos = db.produtos
        return produtos

    def convertenome(nome):
        nome = nome.replace(',', '').replace('-', '').replace(' ', '').replace('(', '').replace(':', '').replace('|', '').replace('?', '').replace('{', '').replace('}', '').replace('`', '').replace('^', '').replace(')', '').replace(
            '.', '').replace('/', '').replace('"', '').replace('!', '').replace(';', '').replace('+', '').replace('~', '').replace('<', '').replace('>', '').replace('	', '').replace('*', '').replace('\'', '').lower()
        return nome
