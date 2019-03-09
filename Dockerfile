FROM trzeci/emscripten:sdk-tag-1.38.13-64bit as builder

RUN git clone https://github.com/TorchCraft/TorchCraftAI.git \
	&& cd TorchCraftAI/3rdparty/openbw \
	&& git clone https://github.com/OpenBW/bwapi.git \
	&& cd ../../scripts/cherryvis \
	&& git clone https://github.com/OpenBW/openbw.git \
	&& cd openbw \
	&& git checkout 4091cad0823eedef60283f1a9dc1fb55cc1793d7 \
	&& git apply --whitespace=nowarn ../openbw_patch.diff \
	&& cd .. \
	&& ./build_js.sh
	
FROM python:3-alpine

COPY --from=builder /src/TorchCraftAI/scripts/cherryvis .

COPY requirements.txt .

RUN apk add --no-cache --virtual .build-deps gcc musl-dev \
    && pip install -r requirements.txt \
	&& apk del .build-deps \
	&& rm -rf requirements.txt
	
EXPOSE 8770

CMD ["./server.py","--host","0.0.0.0:8770"]
