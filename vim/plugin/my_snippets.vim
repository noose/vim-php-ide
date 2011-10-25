" ---------------------------------------------
" PHP
let g:template['php'] = {}
let g:template['php']['90'] = "\<BS>(".g:rs."...".g:re.")".g:rs."...".g:re
let g:template['php']['arr'] = "array(\<cr>\<Tab>".g:rs."...".g:re."\<cr>\<BS>\<BS>\<BS>\<BS>)".g:rs."...".g:re
let g:template['php']['case'] = "case ".g:rs."...".g:re.":\<cr>\<Tab>".g:rs."...".g:re."\<cr>"."break;\<cr>\<BS>\<BS>\<BS>\<BS>".g:rs."...".g:re
let g:template['php']['cle'] = "class ".g:rs."...".g:re." extends ".g:rs."...".g:re." {\<cr>\<Tab>".g:rs."...".g:re."\<cr>\<BS>\<BS>\<BS>\<BS>}"
let g:template['php']['cl'] = "class ".g:rs."...".g:re." {\<cr>\<Tab>".g:rs."...".g:re."\<cr>\<BS>\<BS>\<BS>\<BS>}"
let g:template['php']['def'] = "default:\<cr>\<Tab>".g:rs."...".g:re."\<cr>break;"
let g:template['php']['foree'] = "foreach ($".g:rs."array".g:re." as $".g:rs."key".g:re." => $".g:rs."var".g:re.") {\<cr>\<Tab>".g:rs."...".g:re."\<cr>\<BS>\<BS>\<BS>\<BS>}\<cr>".g:rs."...".g:re
let g:template['php']['fore'] = "foreach ($".g:rs."array".g:re." as $".g:rs."var".g:re.") {\<cr>\<Tab>".g:rs."...".g:re."\<cr>\<BS>\<BS>\<BS>\<BS>}\<cr>".g:rs."...".g:re
let g:template['php']['for'] = "for (".g:rs."...".g:re."; ".g:rs."...".g:re."; ".g:rs."...".g:re.") {\<cr>\<Tab>".g:rs."...".g:re."\<cr>\<BS>\<BS>\<BS>\<BS>}\<cr>".g:rs."...".g:re
let g:template['php']['ife'] = "if (".g:rs."...".g:re.") {\<cr>\<Tab>".g:rs."...".g:re."\<cr>\<BS>\<BS>\<BS>\<BS>} else {\<cr>\<Tab>".g:rs."...".g:re."\<cr>\<BS>\<BS>\<BS>\<BS>}\<cr>".g:rs."...".g:re
let g:template['php']['if'] = "if (".g:rs."...".g:re.") {\<cr>\<Tab>".g:rs."...".g:re."\<cr>\<BS>\<BS>\<BS>\<BS>}\<cr>".g:rs."...".g:re
let g:template['php']['op'] = "{\<cr>\<Tab>".g:rs."...".g:re."\<CR>\<BS>\<BS>\<BS>\<BS>}".g:rs."...".g:re
let g:template['php']['prif'] = "private function ".g:rs."...".g:re."(".g:rs."...".g:re.") {\<cr>\<Tab>".g:rs."...".g:re."\<cr>\<BS>\<BS>\<BS>\<BS>}"
let g:template['php']['priv'] = "private $".g:rs."...".g:re." = ".g:rs."...".g:re.";"
let g:template['php']['prof'] = "protected function ".g:rs."...".g:re."(".g:rs."...".g:re.") {\<cr>\<Tab>".g:rs."...".g:re."\<cr>\<BS>\<BS>\<BS>\<BS>}"
let g:template['php']['prov'] = "protected $".g:rs."...".g:re." = ".g:rs."...".g:re.";"
let g:template['php']['pubf'] = "public function ".g:rs."...".g:re."(".g:rs."...".g:re.") {\<cr>\<Tab>".g:rs."...".g:re."\<cr>\<BS>\<BS>\<BS>\<BS>}"
let g:template['php']['pubv'] = "public $".g:rs."...".g:re." = ".g:rs."...".g:re.";"
let g:template['php']['sw'] = "switch (".g:rs."...".g:re.") {\<cr>\<Tab>case ".g:rs."...".g:re.":\<cr>\<Tab>".g:rs."...".g:re."\<cr>"."break;\<cr>\<BS>\<BS>\<BS>\<BS>".g:rs."...".g:re."\<cr>\<BS>\<BS>\<BS>\<BS>}\<cr>".g:rs."...".g:re
let g:template['php']['th'] = "$this->".g:rs."...".g:re
let g:template['php']['try'] = "try {\<cr>\<Tab>".g:rs."...".g:re."\<cr>\<BS>\<BS>\<BS>\<BS>} catch (".g:rs."exception".g:re." $".g:rs."var".g:re.") {\<cr>\<Tab>".g:rs."...".g:re."\<cr>\<BS>\<BS>\<BS>\<BS>}\<cr>".g:rs."...".g:re
let g:template['php']['wh'] = "while (".g:rs."...".g:re.") {\<cr>\<Tab>".g:rs."...".g:re."\<cr>\<BS>\<BS>\<BS>\<BS>}\<cr>".g:rs."...".g:re
