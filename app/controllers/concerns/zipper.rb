require 'zip'
#アップロードされたパッケージファイルを解凍、パッケージ情報を読み取る
module Zipper
  def self.unzipping(path, output)
    entries = []
    new_directory = File.join(output, "tmp")
    Dir.mkdir(new_directory) unless Dir.exist?(new_directory)
    Zip::InputStream.open(path) do |input|
      # get_next_entryするとinputのoffset（ポインタ）が動く
      while (entry = input.get_next_entry)
        # 書き出し先を作る
        save_path = File.join(new_directory, entry.name)
        # 確認したいのはPACKAGEINFOだけなのでそれだけ解凍。
        if entry.name == "PACKAGEINFO"
            File.open(save_path, "w") do |wf|
              # get_next_entryでポインタが動いているので、毎回input.readでOK
              wf.puts(sjisfix(input.read.to_s).force_encoding('utf-8'))
            end
        end
        entries << save_path
      end
    end
    # 解凍されたファイルたちを返却する
    entries
  end

  # 強制的にS-JISにエンコードを切り替える
  def self.sjisfix(str)
    str.gsub(/([\x83-\xFB])\//n, "\\1\\".force_encoding('utf-8'))
  end
end

