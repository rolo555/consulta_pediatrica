module ActiveScaffold
  module Helpers
    module ListColumnHelpers
      def active_scaffold_column_paperclip(column, record)
        paperclip = record.send("#{column.name}")
        thumbnail_path, original_path = if paperclip.file? and paperclip.styles.include?(PaperclipBridgeHelpers.thumbnail_style)
          [paperclip.url(PaperclipBridgeHelpers.thumbnail_style), paperclip.url()]
        else
          [paperclip.url, paperclip.url]
        end
        lightbox_image_tag(thumbnail_path, original_path, {:class=>"images"})
      end
    end
  end
end