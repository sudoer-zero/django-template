#!/bin/sh
# Spill out all newly installed packages
pip freeze > requirements.txt

# Run flake8 for linting
echo ''
echo '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<'
echo '<<<<<<<<<<<<<<<<<<><<<<<< Flake8 Command >>>>>>>>>>>>>>>>>>>>>>>'
echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
if [[ $(flake8 . --exclude=migrations) ]] 
then
    flake8 . --exclude=migrations
else
    echo 'No violations, GOOD TO GO!'
fi

# Run the projects tests 
echo ''
echo '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<'
echo '<<<<<<<<<<<<<<<<<<><<<<<< Project Tests >>>>>>>>>>>>>>>>>>>>>>>'
echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
python manage.py test

# Display a message for git status output
echo ''
echo '===================== git status message ========================'
if [[ `git status --porcelain` ]]; then
    echo 'there are changes in the repo, please commit them.'
else
    echo 'No changes, GOOD TO GO!'
fi
echo '================================================================='
