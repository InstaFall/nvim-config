; Match <script type="text/babel"> and parse as JSX
((script_element
  (start_tag
    (attribute
      (attribute_name) @_attr
      (#eq? @_attr "type")
      (quoted_attribute_value
        (attribute_value) @_type
        (#eq? @_type "text/babel"))))
  (raw_text) @injection.content)
  (#set! injection.language "jsx")
  (#set! injection.include-children true))

; Optional: match plain JS too
((script_element
  (start_tag
    (attribute
      (attribute_name) @_attr
      (#eq? @_attr "type")
      (quoted_attribute_value
        (attribute_value) @_type
        (#eq? @_type "text/javascript"))))
  (raw_text) @injection.content)
  (#set! injection.language "javascript")
  (#set! injection.include-children true))
