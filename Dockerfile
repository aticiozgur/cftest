FROM alpine:3.5
LABEL Ozgur Atici

COPY ./cftest /app/cftest
RUN chmod +x /app/cftest

ENV PORT 8080
EXPOSE 8080

ENTRYPOINT ["/app/cftest"]