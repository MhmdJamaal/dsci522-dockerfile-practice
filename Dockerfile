# Extend the required minimal-notebook image
FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

# Switch to root to install dependencies
USER root

# Copy the conda lock file into the container
COPY conda-linux-64.lock conda-linux-64.lock


# Create environment from the explicit conda lock file
RUN mamba update --quiet --file /tmp/conda-linux-64.lock \
	&& mamba clean --all -y -f \
	&& fix-permissions "${CONDA_DIR}" \
	&& fix-permissions "/home/${NB_USER}"
 