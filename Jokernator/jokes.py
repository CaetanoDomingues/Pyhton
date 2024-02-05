#Importing those libs below to allow create jokes and make the connection with SMS
import pyjokes
from deep_translator import GoogleTranslator
from twilio.rest import Client 

#The function receives the number of jokes desired by thw user
def initialize_joke(tries):
    account_sid = "AC870b7fbd81e2b2d0446de59d24254af4"
    token = "840ef88f9565d34682c0f5e360d44b7a"
    client = Client(account_sid,token)
    translator = GoogleTranslator(source="en",target="pt")
    for i in range(tries):
        joke = pyjokes.get_joke("en")
        poligote = translator.translate(joke)
        print(poligote)
        #Those numbers are to testing
        client.messages.create(from_= "211339422", body= poligote, to= "313287274628")

#One interaction with the user to indicates how many jokes he/she wants to read 
input = int(input("Quantas piadas desejar ouvir?"))
initialize_joke(input)

