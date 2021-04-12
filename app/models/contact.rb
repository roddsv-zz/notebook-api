class Contact < ApplicationRecord
    belongs_to :kind #se quiser deixar sem o kind, colocar ==> optional: true
    has_many :phones

    # def birthdate_br
    #     I18n.l(self.birthdate) unless self.birthdate.blank?
    # end

    def to_br
        { 
            name: self.name,
            email: self.email,
            birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
        } 
    end

    # def author
    #     "Rodrigo Soares"
    # end

    def kind_description
        self.kind.nil? ? "No kind." : self.kind.description
    end

    def as_json(options={})
        super(
            root: true,
            methods: [:kind_description ],
            #para incluir um campo aninhado ao JSON, pode-se usar ==> include: { kind: {only: :description}}
        )
    end

    # def hello
    #     I18n.t('hello')
    # end

    # def i18n
    #     I18n.default_locale
    # end
end
