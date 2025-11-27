# Extend the required minimal-notebook image
FROM quay.io/jupyter/minimal-notebook


# copy the lockfile into the container
COPY conda-linux-64.lock /home/conda-linux-64.lock

RUN mamba install --quiet --file /home/conda-linux-64.lock \
	&& mamba clean --all -y -f \
	&& fix-permissions "${CONDA_DIR}" \
	&& fix-permissions "/home/${NB_USER}" 