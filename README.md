
# rsapidemo

A simple demo of a working type and provider using Resource API and PDK.

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with rsapidemo](#setup)
    * [What rsapidemo affects](#what-rsapidemo-affects)
    * [Beginning with rsapidemo](#beginning-with-rsapidemo)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)

## Description

The example repo shows a minimal working implementation of a Puppet custom type and provider created with PDK and Resource API. It also contains working unit tests.
You can use this as a starting point for playing around with Resource API and extend it to develop your own type and provider.

## Setup

### Install PDK

To experiment with the module you will need to first install the Puppet Development Kit (PDK), 
see here for installation: <https://puppet.com/docs/pdk/1.x/pdk_install.html>.

### Beginning with rsapidemo

You  install the module by creating a directory and cloning the Github repository. 
For ease of experimenting, we recommend to create a separate directory (for example `modules`) to clone the module into:

```bash
mkdir modules
cd modules
git clone https://github.com/timidri/rsapidemo
cd rsapidemo
```

## Usage

After cloning the module you can start experimenting with the type and provider right away.
Examples of commands:

### List available resources: 

`pdk bundle exec puppet resource demo  --modulepath ~/modules`

### Add a resource named `foo`:

`pdk bundle exec puppet resource demo foo ensure=present --modulepath ~/modules`

### Remove the resource `foo`:

`pdk bundle exec puppet resource demo foo ensure=absent --modulepath ~/modules`

## Limitations

This sample type and provider are only tested on Mac OS.