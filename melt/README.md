# MElt Docker container

## Installation

To build the image, run the following command :

``` 
sudo docker build -t melt -f Dockerfile
```

To run a container :

```
sudo docker run -d -p 5000:5000 -it melt
```

The listening will be by default 5000.

## Testing

To test your setup, you can try to `POST` data.
```
curl -H "Content-Type: application/json" -X POST -d '{"data":"Il fait beau dehors. Mais Paris est trop petit pour pouvoir en profiter, et surtout trop cher"}' http://localhost:5000
```
## Tagset

```
ADJ 	   adjective
ADJWH	   interrogative adjective
ADV	   adverb
ADVWH	   interrogative adverb
CC	   coordination conjunction
CLO	   object clitic pronoun
CLR	   reflexive clitic pronoun
CLS	   subject clitic pronoun
CS	   subordination conjunction
DET	   determiner
DETWH	   interrogative determiner
ET	   foreign word
I	   interjection
NC	   common noun
NPP	   proper noun
P	   preposition
P+D	   preposition+determiner amalgam
P+PRO	   prepositon+pronoun amalgam
PONCT	   punctuation mark
PREF	   prefix
PRO	   full pronoun
PROREL	   relative pronoun
PROWH	   interrogative pronoun
V	   indicative or conditional verb form
VIMP	   imperative verb form
VINF	   infinitive verb form
VPP	   past participle
VPR	   present participle
VS	   subjunctive verb form
```
