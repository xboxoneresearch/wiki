# Xbox One Research Wiki

[![GitHub Workflow – Build](https://img.shields.io/github/actions/workflow/status/xboxoneresearch/wiki/build.yml?branch=master)](https://github.com/xboxoneresearch/wiki/actions?query=workflow%3Abuild)

Various info regarding the hard-/software of the Xbox One gaming console family.

Python framework `properdocs` is used to render the Markdown documentation.

## Contribute

Contributions are very welcome. Here's how you can help:

- Add / correct / expand technical information

- Improve documentation style

- Correct spelling / grammar

- Check the __"Issues"__ tab…

## Workflow

1. __Fork__ this repo

1. Make changes

1. __Verify__ your changes are formatted properly (otherwise the PR cannot be accepted)

1. Send a __Pull Request__

> [!NOTE]
>
> When adding a new page, ensure it's linked in [`NAVIGATION.md`](./docs/NAVIGATION.md).

### Step by step instructions

1. At first: Fork the repository to your account!

2. Clone your fork of the wiki (**Change 'YourUsername' accordingly**):

   ```sh
   # SSH
   git clone git@github.com:YourUsername/wiki.git

   or

   # HTTPS
   git clone https://github.com/YourUsername/wiki.git
   ```

3. Navigate into wiki repository folder

   ```sh
   cd wiki/
   ```

4. Choose one of the two deployment methods below and follow thier instructions:

[Native](#native-deployment) or [Docker](#docker-deployment)

5. At this point, load up the cloned repository in a text editor that has live-markdown preview function.
  - For example: Visual Studio Code. Instructions: (https://code.visualstudio.com/Docs/languages/markdown)

6. Once you are happy and the added changes are looking proper, you are ready to submit your work.

Add modified files for commiting

   ```sh
   git add docs/<edited_file>.md
   git add docs/<edited_file_2>.md
   ...
   ```

Create a new commit

   ```sh
   git commit

   # Now in the upcoming editor, describe the changes you made.
   ```

Push the changes to your forked repository

   ```sh
   git push
   ```

8. Send a Pull Request :)

### Native deployment

1. Create & activate python virtual-environment (might need dependency `python3-venv`, see <https://docs.python.org/3/library/venv.html>).

   ```sh
   python3 -m venv venv
   source venv/bin/activate
   ```

1. Install `properdocs`, and its dependencies:

   ```sh
   pip install -r requirements.txt
   ```

1. Edit docs and verify with the following commands:

   1. Serve the documentation (<http://127.0.0.1:8000>):

      ```sh
      properdocs serve --strict
      ```

   1. Build the documentation:

      ```sh
      properdocs build --strict
      ```

### Docker deployment

1. Execute docker container:

   ```sh
   docker compose up --build --force-recreate
   ```

1. Navigate to <http://127.0.0.1:8000>.

1. Make your changes, then verify the formatting / linking still checks out.
