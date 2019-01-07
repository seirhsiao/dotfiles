{
 :user
     {:jvm-opts ^:replace ["-Xmx3G"]
      :plugins  [
             [lein-environ "1.1.0"]
             [lein-set-version "0.4.1"]
             [lein-simpleton "1.3.0"]
             [lein-try "0.4.3"]
             [lein-ancient "0.6.15"]
             [lein-cljfmt "0.6.3"]
             [lein-pprint "1.1.1"]
             [lein-html5-docs "3.0.3"]
             [lein-marginalia "0.9.1"]
             [lein-swank "1.4.5"]
             [lein-difftest "2.0.0"]
             [lein-checkout-deps "1.0.0"]
             ;; [lein-haml-sass "0.2.4"]
             [lein-midje "3.2.1"]
             [lein-kibit "0.1.6"]
             [lein-exec "0.3.7"]
             ;;[venantius/ultra "0.5.2"]
             [cider/cider-nrepl "0.19.0-SNAPSHOT"]
             ;;[cider/cider-nrepl "0.18.0"]
             ;;[refactor-nrepl "2.4.0"]
             [jonase/eastwood "0.3.3"]
             [nginx-clojure "0.4.5"]
             [luminus/lein-template "3.10.28"]
             ;;https://github.com/phillord/plugin-inject
             ;;lein plugin-inject repl :headless
             ;; [plugin-inject "0.1.0-SNAPSHOT"]
             [slamhound "1.3.1"]
             ;;[alembic "0.3.2"]
             [lein-alembic "0.1.0"]
             [com.jakemccrary/lein-test-refresh "0.23.0"]
             [lein-cloverage "1.0.13"]
             ]
  :aliases  {"slamhound" ["run" "-m" "slam.hound"]
             "eval"      ["run" "-m" "clojure.main/main" "-e"]
             "rebl"      ["trampoline" "run" "-m" "rebel-readline.main"]
             "ancient!"  ["ancient" "upgrade" ":all"]
             "ancientp!" ["ancient" "upgrade-profiles"]
             "midje!"    ["midje" ":autotest"]}
  ;; :ultra {:color-scheme :solarized_dark
  ;;         :stacktraces  false}
  ;; :test-refresh {;:growl true
  ;;                :notify-on-success false}

  :dependencies [
                 [org.clojure/clojure "1.9.0"
                  :exclusions [[log4j/log4j :classifier "*"]
                               [org.slf4j/slf4j-log4j12 :extension "jar"]
                               org.slf4j/slf4j-api
                               ]]
                 [org.clojure/tools.nrepl "0.2.13"
                  :exclusions [org.clojure/clojure]]
                 [org.clojure/tools.namespace "0.2.11"
                  :exclusions [org.clojure/clojure]]
                 [slamhound "1.5.5"]
                 ;;[com.cemerick/pomegranate "1.1.0"]
                 ]
  :middleware   [cider-nrepl.plugin/middleware
                 refactor-nrepl.plugin/middleware]
  ;;:repositories detected in user-level profiles!
  ;;:repositories [
  ;;                  ["central" "http://maven.aliyun.com/nexus/content/groups/public"]
  ;;                  ["local" "http://mvn.local/nexus/releases"]
  ;;                  ["clojars" "https://repo.clojars.org"]
  ;;                  ["clojars-tuna" "https://mirrors.tuna.tsinghua.edu.cn/clojars/"]
  ;;                  ["mvn-clojars" "https://mvnrepository.com/repos/clojars"]
  ;;              ]
  ;; :repl-options {;:init (set! *print-length* 42)
  ;;                :prompt  (fn [ns] (str "[33m" ns "=>[m " ))
  ;;                :welcome (println "[34mtommi's repl.[m")
  ;;                                       ;:nrepl-middleware [io.aviso.nrepl/pretty-middleware]
  ;;                }
  ;; :injections [
  ;;              (let [orig (ns-resolve (doto 'clojure.stacktrace require)
  ;;                   'print-cause-trace)
  ;;                   new (ns-resolve (doto 'clj-stacktrace.repl require)
  ;;               'pst)]
  ;;                (alter-var-root orig (constantly (deref new))))
  ;;              (require '[vinyasa.inject :as inject]
  ;;                        ;; other requires
  ;;                        )
  ;;              (inject/in

  ;;                ;; Inject as is
  ;;                clojure.core
  ;;                [print.foo print->> print-> print-defn print-cond print-sexp print-let]
  ;;                [clojure.core [macroexpand-1 mex] [macroexpand mexx]]
  ;;                [clojure.walk [macroexpand-all mexa]]

  ;;                ;; Inject with > prefix, i.e. >pprint
  ;;                clojure.core >
  ;;                [vinyasa.inject inject]
  ;;                [vinyasa.pull pull]
  ;;                [vinyasa.lein lein]
  ;;                [vinyasa.reimport reimport]
  ;;                [alembic.still distill]
  ;;                [table.core table]
  ;;                [clojure.tools.namespace.repl refresh]
  ;;                [clojure.tools.trace trace trace-vars trace-ns untrace-ns]
  ;;                [clojure.repl apropos dir doc find-doc source pst [root-cause >cause]]
  ;;                [clojure.pprint pprint pp]
  ;;                [clojure.java.shell sh]
  ;;                [criterium.core benchmark quick-benchmark])]

  }
 ;; don't support this tag
 ;; :docs    {:plugins [[lein-html5-docs "3.0.3"]
 ;;                     [lein-marginalia "0.9.1"]]
 ;;           }
 :mirrors {"central" {:name "central"
                      :url  "http://mirrors.ibiblio.org/pub/mirrors/maven2"
                      }
           #"clojars"
           {:name         "Clojar Mirror"
            :url          "https://clojars-mirror.tcrawley.org/repo/"
            :repo-manager true
            }
           "tuna"    {:name         "Clojar Mirror"
                      :url          "https://mirrors.tuna.tsinghua.edu.cn/clojars"
                      :repo-manager true
                      }
           }
 :repl    {:plugins      [
                          [cider/cider-nrepl "0.19.0-SNAPSHOT"]
                          [refactor-nrepl "2.4.0"]
                          ;;[cider/cider-nrepl "0.18.0"]
                          [lein-cljfmt "0.6.3"]
                          ]
           :dependencies [
                          [org.clojure/clojure "1.9.0"
                           :exclusions [[log4j/log4j :classifier "*"]
                                        [org.slf4j/slf4j-log4j12 :extension "jar"]
                                        org.slf4j/slf4j-api
                                        ]
                           ]
                          ;;[alembic "0.3.2"]
                          [lein-alembic "0.1.0"]
                          [com.cemerick/pomegranate "1.1.0"]
                          [org.clojure/tools.nrepl "0.2.13"
                           :exclusions [org.clojure/clojure]]
                          ]
           }
 :dev     {
           :plugins      [
                          [cider/cider-nrepl "0.18.0"]
                          [refactor-nrepl "2.4.0"]
                          [lein-pprint "1.1.1"]
                          [nrepl "0.4.4"]
                          [lein-cljfmt "0.6.3"]
                          [jonase/eastwood "0.3.3"]
                          ]
           :dependencies [
                          [org.clojure/clojure "1.9.0"
                           :exclusions [[log4j/log4j :classifier "*"]
                                        [org.slf4j/slf4j-log4j12 :extension "jar"]
                                        org.slf4j/slf4j-api
                                        ]
                           ]
                          [com.cemerick/pomegranate "1.1.0"]
                          [org.clojure/tools.nrepl "0.2.13"
                           :exclusions [org.clojure/clojure]]
                          ;;["cider/cider-nrepl" "0.18.0"]
                          ]
           ;; :repl-options        {:nrepl-middleware
           ;;                       [cider.nrepl/wrap-apropos
           ;;                        cider.nrepl/wrap-classpath
           ;;                        cider.nrepl/wrap-complete
           ;;                        cider.nrepl/wrap-debug
           ;;                        cider.nrepl/wrap-format
           ;;                        cider.nrepl/wrap-info
           ;;                        cider.nrepl/wrap-inspect
           ;;                        cider.nrepl/wrap-macroexpand
           ;;                        cider.nrepl/wrap-ns
           ;;                        cider.nrepl/wrap-spec
           ;;                        cider.nrepl/wrap-pprint
           ;;                        cider.nrepl/wrap-pprint-fn
           ;;                        cider.nrepl/wrap-profile
           ;;                        cider.nrepl/wrap-refresh
           ;;                        cider.nrepl/wrap-resource
           ;;                        cider.nrepl/wrap-stacktrace
           ;;                        cider.nrepl/wrap-test
           ;;                        cider.nrepl/wrap-trace
           ;;                        cider.nrepl/wrap-out
           ;;                        cider.nrepl/wrap-undef
           ;;                        cider.nrepl/wrap-version]
           ;;                 }

           }
 :exclusions   [org.apache.poi/poi
                org.apache.poi/poi-ooxml]
 :repositories [
                ["java.net" "https://download.java.net/maven/2"]
                ["sonatype" {:url           "https://oss.sonatype.org/content/repositories/releases"
                             ;; If a repository contains releases only setting
                             ;; :snapshots to false will speed up dependencies.
                             :snapshots     false
                             ;; Disable signing releases deployed to this repo.
                             ;; (Not recommended.)
                             :sign-releases false
                             ;; You can also set the policies for how to handle
                             ;; :checksum failures to :fail, :warn, or :ignore.
                             :checksum      :fail
                             ;; How often should this repository be checked for
                             ;; snapshot updates? (:daily, :always, or :never)
                             :update        :always
                             ;; You can also apply them to releases only:
                             :releases      {:checksum :fail :update :always}}]
                ["central" "http://maven.aliyun.com/nexus/content/groups/public"]
                ["local" "http://mvn.local/nexus/releases"]
                ["clojars" "https://repo.clojars.org"]
                ["clojars-tuna" "https://mirrors.tuna.tsinghua.edu.cn/clojars/"]
                ["mvn-clojars" "https://mvnrepository.com/repos/clojars"]
                ]
 }
