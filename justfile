[private]
@default:
    just --list

setup:
    cargo binstall --no-confirm --locked \
    mdbook \
    mdbook-admonish \
    mdbook-linkcheck \
    mdbook-footnote \
    mdbook-cmdrun \
    mdbook-bib

serve:
    mdbook serve --open

draft-proforma:
    {{ if path_exists('tmp/') == "true" { "" } else { `mkdir ./tmp/` } }}
    {{ if path_exists('./tmp/ProForma_v2_Final.docx') == "true" { "" } else { `curl https://raw.githubusercontent.com/HUPO-PSI/ProForma/601532caec79ac8e79f7e81ba27b24c79352ff0d/SpecDocument/Release_v2.0/ProForma_v2_Final.docx --output ./tmp/ProForma_v2_Final.docx` } }}
    pandoc --from=docx --to=commonmark_x --toc --output=./tmp/proforma_draft.md ./tmp/ProForma_v2_Final.docx
