FROM nginx:alpine
COPY index.html /usr/share/nginx/html
COPY lab_book.html /usr/share/nginx/html
COPY spinnaker.html /usr/share/nginx/html
RUN mkdir /usr/share/nginx/html/images
COPY images /usr/share/nginx/html/images
RUN mkdir /usr/share/nginx/html/DL
RUN mkdir /usr/share/nginx/html/slides
COPY slides /usr/share/nginx/html/slides
