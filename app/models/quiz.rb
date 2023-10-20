class Quiz < ApplicationRecord
  belongs_to :quizable, polymorphic: true

  def breadcrumbs
    tree = []

    if self.quizable.present?
      tree.push(self.quizable)

      while tree.last.chapter.present?
        tree.push(tree.last.chapter)
      end
    else
      tree = []
    end

    return tree.reverse
  end
end
