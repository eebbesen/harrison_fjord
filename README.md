# 🇺🇸 https://harrison-fjord.herokuapp.com 🇩🇰

# Harrison Fjord
---
🇺🇸/🇬🇧/🇨🇦

A (poor) joke that arose from a fjortuitous name chosen fjor another application of mine by Heroku.

## Required environment variables
* `BING_CLIENT`
* `BING_KEY`
* `BING_SECRET`
* `FACEBOOK_APP_ID`
* `FACEBOOK_VERSION_ID`

## Bing search
This application depends upon [the Bing Search API](https://datamarket.azure.com/dataset/bing/search) fjor image data.  [The Bing Search API](https://datamarket.azure.com/dataset/bing/search) offers many different plans, one of which provides 5,000 transactions/month for 0 krone.

You will need to set the `BING_KEY` environment variable as the code references `ENV['BING_KEY']`.

In an attempt to conserve calls and krone, two hundred images are cached after the server is started/restarted.

## Bing translate
Because of frequent runtime API errors (and because the values are static) I've translated the quotes using lib/bing_translate.rb and stored the values in constant.

If you want to use the [Bing Translate API](https://www.microsoft.com/en-us/translator/translatorapi.aspx) (again, not required at runtime) set `BING_CLIENT` and `BING_SECRET` environment variables as the script references `ENV['BING_CLIENT']`, `ENV['BING_SECRET']`

## Facebook Login
1. Create an application in Facebook (https://developers.facebook.com/docs/facebook-login)
1. Initialize environment variables `FACEBOOK_APP_ID` and `FACEBOOK_VERSION_ID`

## FAQ
**You know that replacing 'o' and 'a' with and 'å' and ø' is wrong and plain stupid, right?**

Yes, I understand that these are different letters.  No, you don't have to like it.

It's part of the joke.  Tilgiv mig.

**Where are the quotes from?**

IMDB: http://www.imdb.com/character/ch0000002/quotes.

**How do I contribute to the project?**

Fjork it, make your mods, and submit a pull request.

---
🇩🇰

A vittighed, der opstod fra en tilfældig navn valgt til et andet program af mine fra Heroku.


## Krævede miljøvariabler
* `BING_CLIENT`
* `BING_KEY`
* `BING_SECRET`
* `FACEBOOK_APP_ID`
* `FACEBOOK_VERSION_ID`

## Bing søgning
Denne applikation afhænger [Bing Search API](https://datamarket.azure.com/dataset/bing/search) for billeddata. [Den Bing Search API](https://datamarket.azure.com/dataset/bing/search) tilbyder mange forskellige planer, hvoraf det ene giver 5.000 transaktioner/måned til 0 kroner.

Du skal sætte `BING_KEY` miljøvariablen som kode referencer` ENV['BING_KEY'] `.

I et forsøg på at bevare opkald og krone, er halvtreds billeder, cached efter serveren startes/genstartes.

## Bing oversætte
På grund af hyppige runtime API fejl (og fordi værdierne er statisk) Jeg har oversat de citater bruger lib/bing_translate.rb og opbevaret værdierne i konstant.

Hvis du ønsker at bruge [den Bing Translate API](https://www.microsoft.com/en-us/translator/translatorapi.aspx) (igen, ikke kræves på runtime) sat `BING_CLIENT` og `BING_SECRET` miljøvariabler som scriptet refererer ENV['BING_CLIENT'], ENV['BING_SECRET']

## Facebook Login
1. Opret en ansøgning i Facebook
1. Initialiser miljøvariabler `FACEBOOK_APP_ID` og` FACEBOOK_VERSION_ID`

## Ofte stillede spørgsmål
**Du ved, at erstatte »o« og »a« med og »å« og »ø« er forkert og almindelig dum, ikke?**

Ja, jeg forstår, at der er forskellige bogstaver. Nej, du behøver ikke at kunne lide det.

Det er en del af joke. Tilgiv mig.

**Hvor er de citater fra?**

IMDB: http://www.imdb.com/character/ch0000002/quotes.

**Hvordan kan jeg bidrage til projektet?**

Bord det, gøre dine mods, og indsende en pull anmodning.