file_config := "./files.json"
pandoc_output_dir := "./pandoc_output/"
final_path_dir := "./specs_md/"

[private]
@default:
    just --list

# install/update code automation
install:
	curl https://pre-commit.com/install-local.py | python3 -

# setup/update pre-commit hooks
setup:
    pre-commit install --install-hooks # uninstall: `pre-commit uninstall`

# run pandoc to convert from docx to markdown
convert file_format:
    pandoc \
        --from=docx \
        --to=gfm-raw_html \
        --eol=lf \
        --number-sections \
        --wrap=auto \
        --shift-heading-level-by=1 \
        --output={{pandoc_output_dir}}{{file_format}}.temp.md \
        $(jq -r ".PEFF.source" {{file_config}})
    cp --no-clobber {{pandoc_output_dir}}{{file_format}}.temp.md {{final_path_dir}}{{file_format}}.wip.md
