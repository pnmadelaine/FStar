# This Dockerfile should be run from the root FStar directory

ARG ocaml_version=4.12
FROM ocaml/opam:ubuntu-ocaml-$ocaml_version

# FIXME: the `opam depext` command should be unnecessary with opam 2.1
RUN opam depext conf-gmp z3.4.8.5

ADD --chown=opam:opam ./ FStar/
RUN rm -rf FStar/.git

RUN opam install --deps-only FStar/fstar.opam
ARG opamthreads=24
RUN opam install -j $opamthreads -v -v -v FStar/fstar.opam

# RUN mkdir -p FStar-examples/ulib
# RUN mv FStar/examples FStar-examples/examples
# RUN mv FStar/ulib/gmake FStar-examples/ulib/gmake
# RUN make -C FStar-examples/examples

RUN opam uninstall -v -v -v fstar
