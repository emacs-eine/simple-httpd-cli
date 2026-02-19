;;; simple-httpd-cli.el --- A command-line interface for simple-httpd  -*- lexical-binding: t; -*-

;; Copyright (C) 2026  JenChieh

;; Author: JenChieh <jcs090218@gmail.com>
;; Maintainer: JenChieh <jcs090218@gmail.com>
;; URL: https://github.com/emacs-eine/simple-httpd-cli
;; Version: 1.0.0
;; Package-Requires: ((emacs "26.1")
;;                    (simple-httpd "1.5.1")
;;                    (commander "0.7.0")
;;                    (msgu "0.1.0"))
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; A command-line interface for simple-httpd
;;

;;; Code:

(require 'simple-httpd)
(require 'msgu)

(defgroup simple-httpd-cli nil
  "A command-line interface for simple-httpd."
  :prefix "simple-httpd-cli-"
  :group 'tool
  :link '(url-link :tag "Repository" "https://github.com/emacs-eine/simple-httpd-cli"))

(defun simple-httpd-cli--version ()
  "Return the verions of the package `simple-httpd'."
  (package-activate-all)
  (package-version-join
   (package-desc-version (car (alist-get 'simple-httpd package-alist)))))

;;;###autoload
(defun simple-httpd-cli-start (root &optional host port ip-family)
  "Start the http server."
  (let* ((httpd-root (or root default-directory httpd-root))
         (httpd-host (or host httpd-host))
         (httpd-port (or port httpd-port))
         (httpd-ip-family (or ip-family httpd-ip-family)))
    (message "Starting up http-server, serving `%s'" httpd-root)
    (message "")
    (message "simple-httpd version: %s" (simple-httpd-cli--version))
    (message "")
    (message "Available on:")
    (message "  %s:%s" httpd-host httpd-port)
    (message "")
    (message "Hit CTRL-C to stop the server")
    (httpd-start)
    ;; Run forever.
    (while t (sit-for 0.1))))

(provide 'simple-httpd-cli)
;;; simple-httpd-cli.el ends here
