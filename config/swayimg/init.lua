swayimg.viewer.on_key("d", function()
	local image = swayimg.viewer.get_image()
	if image then
		-- Create a 'rejected' folder and move the file
		os.execute('mkdir -p rejected && mv "' .. image.path .. '" rejected/')

		-- Remove the image from the viewer to automatically skip forward
		swayimg.imagelist.remove(image.index)
	end
end)
