FROM node

COPY reveal.js /revealjs
COPY . /revealjs
WORKDIR /revealjs
RUN npm install -g grunt-cli && npm install

RUN groupadd -r revealjs && useradd -r -g revealjs revealjs
RUN chown -R revealjs /revealjs
USER revealjs

EXPOSE 8000
CMD ["grunt", "serve"]
