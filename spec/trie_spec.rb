require_relative "../trie.rb"

describe Trie do
  describe ".new" do
    it "returns an empty trie" do
      expect(Trie.new).to be_empty
    end
  end

  describe "#insert" do
    let(:trie) { Trie.new }

    context "when the trie is empty" do
      let(:trie) { Trie.new }

      it "flags the trie as non-empty" do
        expect {
          trie.insert("a")
        }.to change(trie, :empty?).from(true).to(false)
      end

      it "inserts first single character into the trie" do
        expect {
          trie.insert("a")
        }.to change { trie.root.children.head.value }.from(nil).to be_a Tree

        expect(trie.root.children.head.value.value).to eq("a")
      end

      it "inserts first word into the trie" do
        expect {
          trie.insert("apples")
        }.to change { trie.root.children.head.value }.from(nil).to be_a Tree

        expect(
          trie.root.children.head.value.value
        ).to eq("a")
        expect(
          trie.root.children.head.value.children.head.value.value
        ).to eq("p")
        expect(
          trie.root.children.head.value.children.head.value.children.head.value.value
        ).to eq("p")
        expect(
          trie.root.children.head.value.children.head.value.children.head.value.children.head.value.value
        ).to eq("l")
        expect(
          trie.root.children.head.value.children.head.value.children.head.value.children.head.value.children.head.value.value
        ).to eq("e")
      end
    end

    context "when the trie is non-empty" do
      before { trie.insert("a") }

      it "inserts second single character into the trie" do
        expect {
          trie.insert("b")
        }.to change { trie.root.children.head.next.value }.from(nil).to be_a Tree

        expect(trie.root.children.head.next.value.value).to eq("b")

        expect(trie.root.value).to eq(nil) # Root tree value should always be nil
      end
    end

    context "when the trie is non-empty" do
      before { trie.insert("a"); trie.insert("b") }

      it "inserts third single character into the trie" do
        expect {
          trie.insert("c")
        }.to change { trie.root.children.head.next.next.value }.from(nil).to be_a Tree

        expect(trie.root.children.head.next.next.value.value).to eq("c")
      end
    end

    context "when the trie is non-empty" do
      before { trie.insert("app") }

      it "inserts second word into the trie" do
        expect {
          trie.insert("apple")
        }.to change {
            trie.root.children.head.value.children.head.value.children.head.value.children.head.value
          }.from(nil).to be_a Tree

        expect(
          trie.root.children.head.value.value
        ).to eq("a")
        expect(
          trie.root.children.head.value.children.head.value.value
        ).to eq("p")
        expect(
          trie.root.children.head.value.children.head.value.children.head.value.value
        ).to eq("p")
        expect(
          trie.root.children.head.value.children.head.value.children.head.value.children.head.value.value
        ).to eq("l")
        expect(
          trie.root.children.head.value.children.head.value.children.head.value.children.head.value.children.head.value.value
        ).to eq("e")
      end

      it "inserts third word into the trie" do
        expect {
          trie.insert("big")
        }.to change { trie.root.children.head.next.value }.from(nil).to be_a Tree

        expect(
          trie.root.children.head.next.value.value
        ).to eq("b")
        expect(
          trie.root.children.head.next.value.children.head.value.value
        ).to eq("i")
        expect(
          trie.root.children.head.next.value.children.head.value.children.head.value.value
        ).to eq("g")
      end
    end

    context "when the trie is non-empty" do
      before { trie.insert("apple"); trie.insert("b"); trie.insert("cat") }

      it "inserts third word into the trie" do
        expect {
          trie.insert("big")
        }.to change { trie.root.children.head.next.value.children.head.value }.from(nil).to be_a Tree

        expect(
          trie.root.children.head.next.value.value
        ).to eq("b")
        expect(
          trie.root.children.head.next.value.children.head.value.value
        ).to eq("i")
        expect(
          trie.root.children.head.next.value.children.head.value.children.head.value.value
        ).to eq("g")
      end
    end

    context "when the trie is non-empty" do
      before { trie.insert("apple"); trie.insert("big"); trie.insert("c") }

      it "inserts third word into the trie" do
        expect {
          trie.insert("cat")
        }.to change { trie.root.children.head.next.next.value.children.head.value }.from(nil).to be_a Tree

        expect(
          trie.root.children.head.next.next.value.value
        ).to eq("c")
        expect(
          trie.root.children.head.next.next.value.children.head.value.value
        ).to eq("a")
        expect(
          trie.root.children.head.next.next.value.children.head.value.children.head.value.value
        ).to eq("t")
      end

      it "inserts fourth word into the trie" do
        expect {
          trie.insert("bird")
        }.to change {
            trie.root.children.head.next.value.children.head.value.children.head.next.value
          }.from(nil).to be_a Tree

        expect(
          trie.root.children.head.next.value.value
        ).to eq("b")
        expect(
          trie.root.children.head.next.value.children.head.value.value
        ).to eq("i")
        expect(
          trie.root.children.head.next.value.children.head.value.children.head.next.value.value
        ).to eq("r")
        expect(
          trie.root.children.head.next.value.children.head.value.children.head.next.value.children.head.value.value
        ).to eq("d")
      end
    end
  end

  # describe "#find" do
  #   let(:trie) { Trie.new }

  #   context "when the trie is non-empty" do
  #     before { trie.insert("a") }

  #     it "looks for each character in input string" do
  #       expect {
  #         trie.find("a")
  #       }.to eq("a")
  #     end
  #   end
  # end
end
