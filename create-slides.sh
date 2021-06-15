#!/bin/bash

echo "Generer HTML presentasjon.."
npx @marp-team/marp-cli slides.md

echo "Generer powerpoint presentasjon.."
npx @marp-team/marp-cli slides.md --pptx