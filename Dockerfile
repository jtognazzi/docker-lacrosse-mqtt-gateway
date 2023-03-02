FROM python:3.9-slim-bullseye

# ###############################################################################
# #### ----                    Create user environemt                    --- ####
# ###############################################################################

ENV USER=${USER:-jeelink}
ENV USERNAME=${USER}
ENV USER_ID=${USER_ID:-1000}
ENV GROUP_ID=${GROUP_ID:-1000}
ENV PASS=${PASS:-false}
ENV SSH_PASSWORD_AUTH=${SSH_PASSWORD_AUTH:-false}
ENV ACTIVATE_HOST_KEY=${ACTIVATE_HOST_KEY:-false}
ENV SUDO_PASS=${SUDO_PASS:-false}

ENV HOME=/home/${USERNAME}

RUN groupadd -g ${GROUP_ID} ${USERNAME} && \
useradd ${USERNAME} -m -d ${HOME} -s /bin/bash -g ${USERNAME} && \
usermod -aG sudo ${USERNAME} 

USER $USERNAME

# ###############################################################################
# #### ----                    Start application                         --- ####
# ###############################################################################

COPY --chown=$USERNAME:$USERNAME requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt

COPY --chown=$USERNAME:$USERNAME lacrosse-mqtt-gateway.py /app/lacrosse-mqtt-gateway.py

WORKDIR /app

ENTRYPOINT ["python"]

CMD ["/app/lacrosse-mqtt-gateway.py"]
