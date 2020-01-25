FROM alpine
COPY showuid.alpine /tool/
RUN chown root:root /tool/* && chmod u+s /tool/*
CMD /tool/showuid.alpine
