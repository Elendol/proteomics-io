[private]
@default:
    just --list

setup:
    cargo binstall --no-confirm --locked \
    mdbook \
    mdbook-admonish \
    mdbook-linkcheck \
    mdbook-footnote \
    mdbook-cmdrun

serve:
    mdbook serve --open
