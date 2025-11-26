# Extend the required minimal-notebook image
FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

# Switch to root to install dependencies
USER root

# Copy the conda lock file into the container
COPY conda-linux-64.lock conda-linux-64.lock

# Switch back to notebook user
USER ${NB_UID}

# Create environment from the explicit conda lock file
RUN conda create -n myenv --file /tmp/conda-linux-64.lock && \
    conda clean --all -f -y

# Activate the environment by default
ENV PATH="/opt/conda/envs/myenv/bin:${PATH}"

# Working directory
WORKDIR /home/jovyan
