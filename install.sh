#! /bin/bash

SCRIPT_DIR=`dirname "$(readlink -f "$0")"`

echo ==================== Neovim =========================
source $SCRIPT_DIR/nvim/install.sh
echo ==================== Neovim Done ====================

echo ==================== Conda ==========================
source $SCRIPT_DIR/miniconda/install.sh
echo ==================== Conda Done =====================


echo ==================== pip ============================
source $SCRIPT_DIR/pip/install.sh
echo ==================== pip Done =======================

