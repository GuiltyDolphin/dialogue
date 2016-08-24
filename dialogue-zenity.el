;;; dialogue-zenity.el --- Zenity implementation for dialogue.

;; Copyright (C) 2016 Ben Moon
;; Author: Ben Moon <guiltydolphin@gmail.com>

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;;
;;; Zenity implementation for dialogue.
;;;
;;; Code:

(defun dialogue-zenity--create-dialogue (type buffer &rest program-args)
  "Start a Zenity process for a TYPE dialogue box with buffer BUFFER.
PROGRAM-ARGS is treated the same as in `start-process'."
  (apply 'start-process
         (format "dialogue-zenity-%s-%s" type (random 1000)) buffer "zenity"
         (format "--%s" type) program-args))

(defun dialogue-zenity--create-dialogue-progress (title text)
  "Create a zenity progress dialogue with title TITLE and initial text TEXT."
  (dialogue-zenity--create-dialogue "progress" nil "--title" title "--text" text))

(provide 'dialogue-zenity)
;;; dialogue-zenity.el ends here
