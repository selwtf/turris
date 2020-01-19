#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------

FROM selwtf/build-turris-sdk:omnia-latest

### add sudo support
USER root
RUN apt update && \
	apt -y install --no-install-recommends \
    sudo vim
RUN echo turris-build ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/turris-build &&\
    chmod 0440 /etc/sudoers.d/turris-build
USER turris-build
