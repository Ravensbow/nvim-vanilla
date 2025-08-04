;; extends

(method_declaration
  body: (block) @method.inner) @method.outer
(class_declaration
  body: (declaration_list) @class.inner) @class.outer
