;;; corporate-bs-generator.el --- Generate random corporate buzz phrases  -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Grant Rettke <gcr@wisdomandwonder.com>
;; Copyright (C) 2018  Jann Sharpe <sstarwoman@hotmail.com>

;; Author: Grant Rettke <gcr@wisdomandwonder.com>
;; Homepage: https://github.com/grettke/corporate-bs-generator
;; URL: http://raw.githubusercontent.com/grettke/corporate-bs-generator/master/corporate-bs-generator.el
;; Version: 0.9
;; Package-Requires: ((emacs "24"))
;; Keywords: games

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Overview:
;;
;; Generate random corporate buzz phrases to impress your friends and get
;; ahead in the industry.
;;
;; Useful in elevator pitches, business meetings, and most organizational events.
;;
;; Examples
;;
;; * _proactively provide access to seamless core competencies_
;;
;; * _objectively expedite effective sprints_
;;
;; * _quickly cultivate equity invested resources_
;;
;; * _globally iterate on-demand ideas_

;; Usage:
;;
;; <table border="1">
;;   <caption>API</caption>
;;   <tr>
;;     <th>Keystroke</th>
;;     <th>Documentation</th>
;;   </tr>
;;   <tr>
;;     <td><i>M-x corporate-bs-generator-create</i></td>
;;     <td>Display a phrase in the minibuffer.</td>
;;   </tr>
;;   <tr>
;;     <td><i>C-u M-x corporate-bs-generator-create</i></td>
;;     <td>Display a phrase in the minibuffer and insert it into this buffer.</td>
;;   </tr>
;;   <tr>
;;     <td><i>C-u C-u M-x corporate-bs-generator-create</i></td>
;;     <td>Display a phrase in the minibuffer and add it to the kill-ring. Insert this value later on with <i>C-y</i>.</td>
;;   </tr>
;; </table>

;; Installation:
;;
;; Download it to `~/src'.
;;
;; Add the following to your init file to
;;
;; * Add it to your load path
;;
;; * Load it
;;
;;     (add-to-list 'load-path "~/src/corporate-bs-generator")
;;     (require 'corporate-bs-generator)

;; Credits:
;;
;; * [Tommy's Blessing](https://www.atrixnet.com/bs-generator.html)
;;
;; * Mom pair programmed it with me. Thank you mom!

;;; Code:

;; Constants

(defconst corporate-bs-generator--adverbs
  (list
   "appropriately"
   "assertively"
   "authoritatively"
   "collaboratively"
   "compellingly"
   "competently"
   "completely"
   "continually"
   "conveniently"
   "credibly"
   "distinctively"
   "dramatically"
   "dynamically"
   "efficiently"
   "energistically"
   "enthusiastically"
   "fungibly"
   "globally"
   "holisticly"
   "interactively"
   "intrinsically"
   "monotonectally"
   "objectively"
   "phosfluorescently"
   "proactively"
   "professionally"
   "progressively"
   "quickly"
   "rapidiously"
   "seamlessly"
   "synergistically"
   "uniquely"
   )
  "Pool of adverbs.")

(defconst corporate-bs-generator--verbs
  (list
   "actualize"
   "administrate"
   "aggregate"
   "architect"
   "benchmark"
   "brand"
   "build"
   "cloudify"
   "communicate"
   "conceptualize"
   "coordinate"
   "create"
   "cultivate"
   "customize"
   "deliver"
   "deploy"
   "develop"
   "disintermediate"
   "disseminate"
   "drive"
   "e-enable"
   "embrace"
   "empower"
   "enable"
   "engage"
   "engineer"
   "enhance"
   "envisioneer"
   "evisculate"
   "evolve"
   "existing"
   "expedite"
   "exploit"
   "extend"
   "fabricate"
   "facilitate"
   "fashion"
   "formulate"
   "foster"
   "generate"
   "grow"
   "harness"
   "impact"
   "implement"
   "incentivize"
   "incubate"
   "initiate"
   "innovate"
   "integrate"
   "iterate"
   "leverage "
   "leverage other's"
   "maintain"
   "matrix"
   "maximize"
   "mesh"
   "monetize"
   "morph"
   "myocardinate"
   "negotiate"
   "network"
   "optimize"
   "orchestrate"
   "parallel task"
   "plagiarize"
   "pontificate"
   "predominate"
   "procrastinate"
   "productivate"
   "productize"
   "promote"
   "provide access to"
   "pursue"
   "re-engineer"
   "recaptiualize"
   "reconceptualize"
   "redefine"
   "reintermediate"
   "reinvent"
   "repurpose"
   "restore"
   "revolutionize"
   "right-shore"
   "scale"
   "seize"
   "simplify"
   "strategize"
   "streamline"
   "supply"
   "syndicate"
   "synergize"
   "synthesize"
   "target"
   "transform"
   "transition"
   "underwhelm"
   "unleash"
   "utilize"
   "visualize"
   "whiteboard"
   )
  "Pool of verbs.")

(defconst corporate-bs-generator--adjectives
  (list
   "24/365"
   "24/7"
   "accurate"
   "adaptive"
   "agile"
   "alternative"
   "an expanded array of"
   "B2B"
   "B2C"
   "backend"
   "backward-compatible"
   "best-of-breed"
   "bleeding-edge"
   "bricks-and-clicks"
   "business"
   "clicks-and-mortar"
   "client-based"
   "client-centered"
   "client-centric"
   "client-focused"
   "cloud-based"
   "cloud-centric"
   "cloud-ready"
   "cloudified"
   "collaborative"
   "compelling"
   "competitive"
   "cooperative"
   "corporate"
   "cost effective"
   "covalent"
   "cross functional"
   "cross-media"
   "cross-platform"
   "cross-unit"
   "customer directed"
   "customized"
   "cutting-edge"
   "distinctive"
   "distributed"
   "diverse"
   "dynamic"
   "e-business"
   "economically sound"
   "effective"
   "efficient"
   "elastic"
   "emerging"
   "empowered"
   "enabled"
   "end-to-end"
   "enterprise"
   "enterprise-wide"
   "equity invested"
   "error-free"
   "ethical"
   "excellent"
   "exceptional"
   "extensible"
   "extensive"
   "flexible"
   "focused"
   "frictionless"
   "front-end"
   "fully researched"
   "fully tested"
   "functional"
   "functionalized"
   "fungible"
   "future-proof"
   "global"
   "go forward"
   "goal-oriented"
   "granular"
   "high standards in"
   "high-payoff"
   "high-quality"
   "highly efficient"
   "holistic"
   "hyper-scale"
   "impactful"
   "inexpensive"
   "innovative"
   "installed base"
   "integrated"
   "interactive"
   "interdependent"
   "intermandated"
   "interoperable"
   "intuitive"
   "just in time"
   "leading-edge"
   "leveraged"
   "long-term high-impact"
   "low-risk high-yield"
   "magnetic"
   "maintainable"
   "market positioning"
   "market-driven"
   "mission-critical"
   "multidisciplinary"
   "multifunctional"
   "multimedia based"
   "next-generation"
   "on-demand"
   "one-to-one"
   "open-source"
   "optimal"
   "orthogonal"
   "out-of-the-box"
   "pandemic"
   "parallel"
   "performance based"
   "plug-and-play"
   "premier"
   "premium"
   "principle-centered"
   "proactive"
   "process-centric"
   "professional"
   "progressive"
   "prospective"
   "quality"
   "real-time"
   "reliable"
   "resource-leveling"
   "resource-maximizing"
   "resource-sucking"
   "revolutionary"
   "robust"
   "scalable"
   "seamless"
   "stand-alone"
   "standardized"
   "standards compliant"
   "state of the art"
   "sticky"
   "strategic"
   "superior"
   "sustainable"
   "synergistic"
   "tactical"
   "team building"
   "team driven"
   "technically sound"
   "timely"
   "top-line"
   "transparent"
   "turnkey"
   "ubiquitous"
   "unique"
   "user friendly"
   "user-centric"
   "value-added"
   "vertical"
   "viral"
   "virtual"
   "visionary"
   "web-enabled"
   "wireless"
   "world-class"
   "worldwide"
   )
  "Pool of adjectives.")

(defconst corporate-bs-generator--nouns
  (list
   "action items"
   "alignments"
   "applications"
   "architectures"
   "bandwidth"
   "benefits"
   "best practices"
   "catalysts for change"
   "channels"
   "clouds"
   "collaboration and idea-sharing"
   "communities"
   "content"
   "convergence"
   "core competencies"
   "customer service"
   "data"
   "deliverables"
   "e-business"
   "e-commerce"
   "e-markets"
   "e-services"
   "e-tailers"
   "experiences"
   "expertise"
   "functionalities"
   "fungibility"
   "growth strategies"
   "human capital"
   "ideas"
   "imperatives"
   "infomediaries"
   "information"
   "infrastructures"
   "initiatives"
   "innovation"
   "intellectual capital"
   "interfaces"
   "internal or "
   "leadership skills"
   "leadership"
   "manufactured products"
   "markets"
   "materials"
   "meta-services"
   "methodologies"
   "methods of empowerment"
   "metrics"
   "mindshare"
   "models"
   "networks"
   "niche markets"
   "niches"
   "nosql"
   "opportunities"
   "organic"
   "outside the box"
   "outsourcing"
   "paradigms"
   "partnerships"
   "platforms"
   "portals"
   "potentialities"
   "process improvements"
   "processes"
   "products"
   "quality vectors"
   "relationships"
   "resources"
   "results"
   "ROI"
   "scenarios"
   "schemas"
   "scrums"
   "services"
   "solutions"
   "sources"
   "sources"
   "sprints"
   "storage"
   "strategic theme areas"
   "supply chains"
   "synergy"
   "systems"
   "technologies"
   "technology"
   "testing procedures"
   "thinking"
   "total linkage"
   "users"
   "value"
   "virtualization"
   "vortals"
   "web services"
   "web-readiness"
   "wins"
   )
  "Pool of nouns.")

;; Functions

(defun corporate-bs-generator--random-parts-of-speech (parts)
  "Return a random value from the parts of speech list PARTS."
  (let* ((ln (length parts))
         (rnd (random ln))
         (result (nth rnd parts)))
    result))

(defun corporate-bs-generator--make ()
  "Make the motto."
  (interactive)
  (let* ((adverb (corporate-bs-generator--random-parts-of-speech corporate-bs-generator--adverbs))
         (verb (corporate-bs-generator--random-parts-of-speech corporate-bs-generator--verbs))
         (adjective (corporate-bs-generator--random-parts-of-speech corporate-bs-generator--adjectives))
         (noun (corporate-bs-generator--random-parts-of-speech
                corporate-bs-generator--nouns))
         (result (format "%s %s %s %s" adverb verb adjective noun)))
        result))

;; Features

(defun corporate-bs-generator-create ()
  "Generate a random corporate buzz phrase.

Displays it in a message and return it.

With one prefix argument insert the string.

With two prefix arguments add the string to the kill-ring."
  (interactive)
  (let* ((result (corporate-bs-generator--make)))
    (message "%s" result)
    (when (equal current-prefix-arg '(4)) (insert result))
    (when (equal current-prefix-arg '(16)) (kill-new result))
    result))

(provide 'corporate-bs-generator)
;;; corporate-bs-generator.el ends here
