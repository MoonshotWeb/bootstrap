note
	description: "[
		Representation of an effected {BS_LINK_BUTTON}.
		]"

class
	BS_LINK_BUTTON

inherit
	HTML_A
		undefine
			default_create
		end

	BS_BUTTON
		undefine
			out
		end

	BS
		undefine
			default_create,
			out
		end

create
	make_with_text,
	make_with_text_and_link

feature {NONE} -- Initialziation

	make_with_text (a_text, a_style, a_size: STRING)
			-- <Precursor>
		require else
			valid_style: button_styles_list.has (a_style)
			valid_size: button_sizes_list.has (a_size)
		do
			make_with_text_and_link (a_text, a_style, a_size, "#")
		end

	make_with_text_and_link (a_text, a_style, a_size, a_link: STRING)
			--
		require
			valid_style: button_styles_list.has (a_style)
			valid_size: button_sizes_list.has (a_size)
		do
			default_create
			set_text_content (a_text)
			set_href (a_link)
			set_class_names (class_names (a_style, a_size))
			set_role ("button")
		end

feature -- Access

	item: HTML_A
			-- Reference to `item' even if in container(s).
		attribute
			Result := Current
		end

note
	design_intent: "[
		Your_text_goes_here
		]"

end
