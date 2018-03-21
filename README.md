## Notes

## MElt

MElt is a freely available (LGPL) state-of-the-art sequence labeller that is meant to be trained on both an annotated corpus and an external lexicon. It was initially developed by Pascal Denis and Benoît Sagot. Recent evolutions have been carried out by Benoît Sagot. MElt allows for using multiclass Maximum-Entropy Markov models (MEMMs) or multiclass perceptrons (multitrons) as underlying statistical devices. Its output is in the Brown format (one sentence per line, each sentence being a space-separated sequence of annotated words in the word/tag format).

cf [credits](#credits)

## FastText


A `Dockerfile` to run a container installing and running `MElt` is provided.
To preprocess (Tokenize and POS tag) a specific file located in the folder `data`, run :

## Installation

### Proxy

If there is no proxy, remove in the `Dockerfile` the environement varialbles.

Make sure you updated the file `/etc/systemd/system/docker.service.d` with the correct proxy settings :
```
[Service]
Environment="HTTP_PROXY=https://proxy:port/"
Environment="HTTPS_PROXY=https://proxy:port/"
```

And then, flush the changes :
```
sudo systemctl daemon-reload
sudo systemctl restart docker
```

Check following [link](https://stackoverflow.com/questions/26550360/docker-ubuntu-behind-proxy) for details.



### Credits

- Pascal Denis and Benoît Sagot (2012). Coupling an annotated corpus and a lexicon for state-of-the-art POS tagging. In Language Resources and Evaluation, DOI 10.1007/s10579-012-9193-0.

- Benoît Sagot (2016). External Lexical Information for Multilingual Part-of-Speech Tagging. INRIA Scientific Report 8924.
