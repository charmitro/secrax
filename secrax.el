;;; secrax.el --- Secrax -*- lexical-binding: t -*-

;; Copyright (C) 2023 Free Software Foundation, Inc.

;; Maintainer: Charalampos Mitrodimas <charmitro@gmail.com>
;; URL: https://github.com/charmitro/secrax
;; Version: 0.0.1
;; Package-Requires: ((emacs "27.1"))

;;; Commentary:
;;; A Emacs Package where you can store secrets in various forms, such
;;; as(and many more),
;;;   * login credentials
;;;   * secrets(encrypted/decrypted)
;;;   * plain text information
;;;
;;; TODO:
;;;   * [PARTIALLY DONE] Implement `secrax-add-secret'.
;;;     Should `value' be a list with it's size based on a input(N),
;;;     iterate N times and append all list items under the entry-title?"
;;;   * Implement `secrax-paste-secret'.
;;;   * Add modes/types of encyption to be saved with.

;;; Code:

(defgroup secrax nil
  "Group for customizing Secrax variables."
  :group 'secrets)

(defcustom secrax-file ""
  "File name that Secrax is going to use as default writing location."
  :type 'string
  :group 'secrax)

(defun secrax-setup ()
  "Interactive setup function for setting the `secrax-file' variable."
  (interactive)
  (setq secrax-file (read-file-name "Enter file name:"))
  (message "Set %s for secrax default location." secrax-file))

(defun secrax-add-secret (entry-title value)
  "Add a secret to `secrax-file' ENTRY-TITLE VALUE."

  (interactive
   (list
    (read-string "Enter entry title: ")
    (read-string "Enter entry value: ")))
  (append-to-file (format "[%s]\n%s\n" entry-title value) nil secrax-file)
  (message "Added entry %s with value %s" entry-title value))

(defun secrax-paste-secret ()
  "Get a secret saved in `secrax-file' and paste it cursor position."
  (interactive))

(provide 'secrax)

;;; secrax.el ends here.
