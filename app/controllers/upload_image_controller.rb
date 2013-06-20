class UploadImageController < ApplicationController
	def upload
		if params[:picture]
			ext = File.extname(params[:picture].original_filename)
			if ext != '.jpg' and ext != '.png' and ext != '.jpeg'
				redirect_to upload_image_path, :notice => "Selecione somente arquivos com extensão .png, .jpg ou .jpeg"
			else
				path = File.join(Rails.root, "public/images_post", params[:picture].original_filename)
				
				# escreve o arquivo no local designado
				File.open(path, "wb") do |f| 
					f.write(params[:picture].read)
				end
				
				redirect_to upload_image_path, :notice => "Imagem salva com suuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuucesso"
			end
		else
			redirect_to upload_image_path, :notice => "Selecione uma imagem"
		end
	end
end
