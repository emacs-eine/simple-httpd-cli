@echo off
emacs -batch -Q -l %~dp0simple-httpd-cli -- %*
