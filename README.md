# 🇺🇸 https://harrison-fjord.onrender.com/ 🇩🇰
# 🇺🇸 https://harrison-fjord.onrender.com/se 🇸🇪

# Harrison Fjord
---
🇺🇸/🇬🇧/🇨🇦

A (poor) joke that arose from a fjortuitous name chosen fjor another application of mine by Heroku.

## Required environment variables
* `BING_CLIENT`
* `BING_KEY`
* `BING_SECRET`
* `DELETE_KEY` (for picture managment console)

## Bing search
This application depends upon [the Bing Cognitive Search API](https://datamarket.azure.com/dataset/bing/search) fjor image data.  [The Bing Search API](https://www.microsoft.com/cognitive-services/en-us/bing-image-search-api) offers many different plans, one of which provides 1,000 transactions/month for 0 krone for three months.

## Bing translate
Because of frequent runtime API errors (and because the values are static) I've translated the quotes using lib/bing_translate.rb and stored the values in a constant.

If you want to use the [Bing Translate API](https://www.microsoft.com/en-us/translator/translatorapi.aspx) (not required at runtime) set `BING_CLIENT`, `BING_KEY`, and `BING_SECRET` environment variables as the script references `ENV['BING_CLIENT']`, `ENV['BING_SECRET']`

## FAQ
**You know that replacing 'a' and 'o' with and 'å' and 'ø' is wrong and plain stupid, right?**

Yes, I understand that these are different letters.  No, you don't have to like it.

It's part of the joke.  Tilgiv mig.

**Where are the quotes from?**

IMDB: http://www.imdb.com/character/ch0000002/quotes.

**How do I contribute to the project?**

Fjork it, make your mods, and submit a pull request.

## Up and running
### Populate the pictures
In a rails console, execute
```ruby
load 'lib/bing_links.rb'
```
or (for a limited set of pictures) using the seeds
```bash
bin/rails db:seed
```

### Run the application
```bash
yarn install --check-files
bin/rails webpacker:compile
bin/rails s
```

### Test the application
```bash
bin/rake
```

### About routes
* root resolves to Danish
* /dk resolves to Danish
* /se resolves to Swedish

---
🇩🇰

A vittighed, der opstod fra en tilfældig navn valgt til et andet program af mine fra Heroku.


## Krævede miljøvariabler
* `BING_CLIENT`
* `BING_KEY`
* `BING_SECRET`
* `DELETE_KEY`

## Bing søgning
Denne applikation afhænger [Bing Search API](https://datamarket.azure.com/dataset/bing/search) for billeddata. [Den Bing Search API](https://datamarket.azure.com/dataset/bing/search) tilbyder mange forskellige planer, hvoraf det ene giver 5.000 transaktioner/måned til 0 kroner.

Du skal sætte `BING_KEY` miljøvariablen som kode referencer `ENV['BING_KEY'] `.

I et forsøg på at bevare opkald og krone, er halvtreds billeder, cached efter serveren startes/genstartes.

## Bing oversætte
På grund af hyppige runtime API fejl (og fordi værdierne er statisk) Jeg har oversat de citater bruger lib/bing_translate.rb og opbevaret værdierne i konstant.

Hvis du ønsker at bruge [den Bing Translate API](https://www.microsoft.com/en-us/translator/translatorapi.aspx) (igen, ikke kræves på runtime) sat `BING_CLIENT` og `BING_SECRET` miljøvariabler som scriptet refererer `ENV['BING_CLIENT']`, `ENV['BING_SECRET']`

## Ofte stillede spørgsmål
**Du ved, at erstatte »a« og »o« med og »å« og »ø« er forkert og almindelig dum, ikke?**

Ja, jeg forstår, at der er forskellige bogstaver. Nej, du behøver ikke at kunne lide det.

Det er en del af joke. Tilgiv mig.

**Hvor er de citater fra?**

IMDB: http://www.imdb.com/character/ch0000002/quotes.

**Hvordan kan jeg bidrage til projektet?**

Bord det, gøre dine mods, og indsende en pull anmodning.

---
🇸🇪

Kommer snart!
